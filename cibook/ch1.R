library("tidyverse")

# メール配信テストデータ入力
email_data <- read_csv("http://www.minethatdata.com/Kevin_Hillstrom_MineThatData_E-MailAnalytics_DataMiningChallenge_2008.03.20.csv")

# 男性向けメール配信に絞る
male_df <- email_data %>%
  filter(segment != "Womens E-Mail") %>%
  mutate(treatment = if_else(segment == "Mens E-Mail", 1, 0))

# メール配信の有無による結果確認
summary_by_segment <- mail_df %>%
  group_by(treatment) %>%
  summarise(conversion_rate = mean(conversion), spend_mean = mean(spend), count = n())

# t検定
## メール配信群
mens_mail <- male_df %>%
  filter(treatment == 1) %>%
  pull(spend)

## メール配信されていない群
no_mail <- male_df %>%
  filter(treatment == 0) %>%
  pull(spend)

## 有意差検定
## var.equal: 同じ分散を持つことを仮定
rct_ttest <- t.test(mens_mail, no_mail, var.equal = TRUE)