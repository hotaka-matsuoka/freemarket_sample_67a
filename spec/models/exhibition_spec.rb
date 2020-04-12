require 'rails_helper'

RSpec.describe Exhibition do
  describe '#create' do
    context 'exhibitionが保存できる場合' do
      it '全ての情報を保存できる場合' do
        expect(build(:exhibition)).to be_valid
      end
      it 'ブランド以外の全ての情報を保存できる場合' do
        expect(build(:exhibition, brand: nil)).to be_valid    
      end
    end


    # context 'exhibitionが保存できない場合' do

    # end
  end
end