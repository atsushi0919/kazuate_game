def introduce_msg
  puts <<~TEXT
         【 数当てゲーム 】
         ・0から9までの中から1個ずつ使って作られた、#{DIGIT}桁の数字を当ててね
         ・数字と位置の両方が合っている数は◎、数字が合っていて位置が違う数は△で表示されるよ
         ・回答のチャンスは#{ANSWER_CHANCE}回だよ

       TEXT
end

def checking_answers(answered_num)
  res = [0, 0]
  SELECTED_NUM.zip(answered_num) do |s_num, a_num|
    if s_num == a_num
      res[0] += 1
    elsif SELECTED_NUM.include?(a_num)
      res[1] += 1
    end
  end
  res
end

# 桁数
DIGIT = 4
# 回答回数
ANSWER_CHANCE = 15
# 正解ナンバー
SELECTED_NUM = (0..9).to_a.sample(DIGIT)

introduce_msg
correct = false
answer_times = 1
while answer_times <= ANSWER_CHANCE
  print "#{answer_times.to_s.rjust(2)}回目: "
  answered_num = gets.chomp.chars.map(&:to_i)
  res = checking_answers(answered_num)
  puts "◎: #{res[0]}  △: #{res[1]}"
  if res[0] == DIGIT
    correct = true
    break
  end
  answer_times += 1
end

if correct
  puts "あたり！やったね！"
else
  puts "ざんねん！正解は #{SELECTED_NUM.join} でした。また挑戦してね！"
end
