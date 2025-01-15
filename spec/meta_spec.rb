describe 'base test' do
  subject { 2+2 }
  context 'check that rspec is working' do
    it { is_expected.to eq(4) }
  end
end