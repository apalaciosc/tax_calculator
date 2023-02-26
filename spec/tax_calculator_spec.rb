require_relative '../tax_calculator'

describe TaxCalculator do
  describe '#run' do
    let(:input1) do
      "2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85"
    end

    let(:input2) do
      "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50"
    end

    let(:input3) do
      "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n"\
      '3 imported boxes of chocolates at 11.25'
    end

    context 'when there are no imported products' do
      let(:expected_response) do
        "2 book: 24.98\n" \
        "1 music CD: 16.49\n" \
        "1 chocolate bar: 0.85\n" \
        "Sales Taxes: 1.50\n" \
        'Total: 42.32'
      end

      subject do
        $stdout = StringIO.new
        TaxCalculator.new(input1).run!

        $stdout.rewind
        $stdout.read.strip
      end

      it { expect(subject).to eq(expected_response) }
    end

    context 'when there are imported products' do
      let(:expected_response) do
        "1 imported box of chocolates: 10.50\n" \
        "1 imported bottle of perfume: 54.65\n" \
        "Sales Taxes: 7.65\n" \
        'Total: 65.15'
      end

      subject do
        $stdout = StringIO.new
        TaxCalculator.new(input2).run!

        $stdout.rewind
        $stdout.read.strip
      end

      it { expect(subject).to eq(expected_response) }
    end

    context 'when there are imported products and products without taxes' do
      let(:expected_response) do
        "1 imported bottle of perfume: 32.19\n" \
        "1 bottle of perfume: 20.89\n" \
        "1 packet of headache pills: 9.75\n" \
        "3 imported boxes of chocolates: 35.55\n" \
        "Sales Taxes: 7.90\n" \
        'Total: 98.38'
      end

      subject do
        $stdout = StringIO.new
        TaxCalculator.new(input3).run!

        $stdout.rewind
        $stdout.read.strip
      end

      it { expect(subject).to eq(expected_response) }
    end
  end
end
