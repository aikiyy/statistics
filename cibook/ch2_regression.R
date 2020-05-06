library("tidyverse")
library("broom")

# メール配信テストデータ入力
email_data <- read_csv("http://www.minethatdata.com/Kevin_Hillstrom_MineThatData_E-MailAnalytics_DataMiningChallenge_2008.03.20.csv")

# 男性向けメール配信に絞る
male_df <- email_data %>%
  filter(segment != "Womens E-Mail") %>%
  mutate(treatment = if_else(segment == "Mens E-Mail", 1, 0))

# セレクションバイアスのあるデータを作成
## seedを固定
set.seed(1)

## 条件に反応するサンプルの量を半分にする
obs_rate_c <- 0.5
obs_rate_t <- 0.5

## バイアスのあるデータを作成
biased_data <- male_df %>%
  mutate(obs_rate_c =
           ifelse( (history > 300) | (recency < 6) |
                     (channel == "Multichannel"), obs_rate_c, 1),
         obs_rate_t =
           ifelse( (history > 300) | (recency < 6) |
                     (channel == "Multichannel"), 1, obs_rate_t),
         random_number = runif(n = NROW(male_df))) %>%
  filter( (treatment == 0 & random_number < obs_rate_c ) |
            (treatment == 1 & random_number < obs_rate_t) )

## 回帰分析の実行
biased_reg <- lm(data = biased_data, formula = spend ~ treatment + history)

## 分析結果のレポート
summary(biased_reg)

## 推定されたパラメータを取り出す
biased_reg_coef <- tidy(biased_reg)
summary(biased_reg_coef)

# RCTデータでの回帰分析とバイアスのあるデータでの回帰分析の比較
## RCTデータでの単回帰
rct_reg <- lm(data = male_df, formula = spend ~ treatment)
rct_reg_coef <- summary(rct_reg) %>% tidy()

## バイアスのあるデータでの単回帰
nonrct_reg <- lm(data = biased_data, formula = spend ~ treatment)
nonrct_reg_coef <- summary(nonrct_reg) %>% tidy()

## バイアスのあるデータでの重回帰
nonrct_mreg <- lm(data = biased_data,
                  formula = spend ~ treatment + recency + channel + history)
nonrct_mreg_coef <- tidy(nonrct_mreg)

# OVBの確認
## bloomの読み出し
library(broom)

## モデル式のベクトルを用意
formula_vec <- c(spend ~ treatment + recency + channel, # modelA
                 spend ~ treatment + recency + channel + history, # modelB
                 history ~ treatment + recency + channel) # modelC
names(formula_vec) <- paste("reg", LETTERS[1:3], sep="_")

## モデル式のデータフレーム化
models <- formula_vec %>%
  enframe(name = "model_index", value = "formula")

## まとめて回帰分析を実行
df_models <- models %>%
  mutate(model = map(.x = formula, .f = lm, data = biased_data)) %>%
  mutate(lm_result = map(.x = model, .f = tidy))

## モデルの結果を整形
df_results <- df_models %>%
  mutate(formula = as.character(formula)) %>%
  select(formula, model_index, lm_result) %>%
  unnest(cols = c(lm_result))

## モデルA,B,Cでのtreatmentのパラメータを抜き出す
treatment_coef <- df_results %>%
  filter(term == "treatment") %>%
  pull(estimate)

## モデルBからhistoryのパラメータを抜き出す
history_coef <- df_results %>%
  filter(model_index == "reg_B", term == "history") %>%
  pull(estimate)

## OVBの確認
OVB <- history_coef*treatment_coef[3]
coef_gap <- treatment_coef[1] - treatment_coef[2]
OVB # beta_2 * gamma_1
coef_gap # alpha_1 - beta_1