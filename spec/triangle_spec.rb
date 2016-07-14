require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do

  context '正三角形の場合' do
    specify { expect(Triangle.pattern(1, 1, 1)).to eq '正三角形ですね！' }
    specify { expect(Triangle.pattern(2, 2, 1.999)).not_to eq '正三角形ですね！' }
    specify { expect(Triangle.pattern(2, 2, 2.001)).not_to eq '正三角形ですね！' }
  end
  context '二等辺三角形の場合' do
    specify { expect(Triangle.pattern(2, 2, 1)).to eq '二等辺三角形ですね！' }
    specify { expect(Triangle.pattern(1, 1, 1.001)).to eq '二等辺三角形ですね！' }
    specify { expect(Triangle.pattern(1, 1, 1.999)).to eq '二等辺三角形ですね！' }
    specify { expect(Triangle.pattern(1, 1, 1.0)).not_to eq '二等辺三角形ですね！' }
    specify { expect(Triangle.pattern(1, 1, 2.0)).not_to eq '二等辺三角形ですね！' }
  end
  context '不等辺三角形の場合' do
    specify { expect(Triangle.pattern(2, 3, 4)).to eq '不等辺三角形ですね！' }
    specify { expect(Triangle.pattern(2, 3, 1.001)).to eq '不等辺三角形ですね！' }
    specify { expect(Triangle.pattern(2, 3, 1.999)).to eq '不等辺三角形ですね！' }
    specify { expect(Triangle.pattern(2, 3, 1.0)).not_to eq '不等辺三角形ですね！' }
    specify { expect(Triangle.pattern(2, 3, 2.0)).not_to eq '不等辺三角形ですね！' }
  end

  describe '入力時の異常' do
    context 'nilが含まれる場合' do
      specify { expect(Triangle.pattern(nil, 1, 1)).to eq '正しい値を入力してください。' }
      specify { expect(Triangle.pattern(1, nil, 1)).to eq '正しい値を入力してください。' }
      specify { expect(Triangle.pattern(1, 1, nil)).to eq '正しい値を入力してください。' }
      specify { expect(Triangle.pattern(nil, nil, nil)).to eq '正しい値を入力してください。' }
    end
    context '文字が含まれる場合' do
      specify { expect(Triangle.pattern('1', 1, 1)).to eq '正しい値を入力してください。' }
      specify { expect(Triangle.pattern(1, '1', 1)).to eq '正しい値を入力してください。' }
      specify { expect(Triangle.pattern(1, 1, '1')).to eq '正しい値を入力してください。' }
      specify { expect(Triangle.pattern('1', '2', '3')).to eq '正しい値を入力してください。' }
    end
  end

  describe '異常ステータス' do
    context '長さがマイナスの辺が含まれている場合' do
      specify { expect(Triangle.pattern(-1, 1, 1)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, -1, 1)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, 1, -1)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, -1, -1)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(-1, -1, -1)).to eq '三角形じゃないです＞＜' }
    end
    context '長さが０の辺が含まれている場合' do
      specify { expect(Triangle.pattern(0, 1, 1)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, 0, 1)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, 1, 0)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(0, 0, 0)).to eq '三角形じゃないです＞＜' }
    end
    context '２辺の和がもう１辺と等しい場合' do
      specify { expect(Triangle.pattern(1, 2, 3)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, 3, 2)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(3, 1, 2)).to eq '三角形じゃないです＞＜' }
    end
    context '２辺の和がもう１辺を超える場合' do
      specify { expect(Triangle.pattern(1, 2, 4)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(1, 4, 2)).to eq '三角形じゃないです＞＜' }
      specify { expect(Triangle.pattern(4, 1, 2)).to eq '三角形じゃないです＞＜' }
    end
  end
end
