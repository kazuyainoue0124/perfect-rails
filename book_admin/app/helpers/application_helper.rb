module ApplicationHelper
  def to_hankaku(str)
    # 全角の英文字を半角に変換
    str.tr('Ａ-Ｚａ-ｚ', 'A-Za-z')
  end
end
