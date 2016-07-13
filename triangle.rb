class Triangle

  def self.pattern(a, b, c)
    return '正しい値を入力してください。' if !a.kind_of?(Integer) or !b.kind_of?(Integer) or !c.kind_of?(Integer)

    return '三角形じゃないです＞＜' unless a < (b + c) and b < (a + c) and c < (a + b)
    return '正三角形ですね！' if a == b and b == c
    return '二等辺三角形ですね！' if a == b || a == c || b == c
    return '不等辺三角形ですね！'
  end
end

puts Triangle.pattern(ARGV[0], ARGV[1], ARGV[2])

