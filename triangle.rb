class Triangle

  def self.pattern(a, b, c)
    return '正しい値を入力してください。' if !a.kind_of?(Numeric) or !b.kind_of?(Numeric) or !c.kind_of?(Numeric)

    return '三角形じゃないです＞＜' unless a < (b + c) and b < (a + c) and c < (a + b)
    return '正三角形ですね！' if a == b and b == c
    return '二等辺三角形ですね！' if a == b || a == c || b == c
    return '不等辺三角形ですね！'
  end
end

puts Triangle.pattern(ARGV[0].to_f, ARGV[1].to_f, ARGV[2].to_f)

