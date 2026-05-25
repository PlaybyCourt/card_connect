require 'test_helper'

describe CardConnect::CardPointe::BinResponse do
  describe 'with full BIN data populated' do
    before do
      @response = CardConnect::CardPointe::BinResponse.new(valid_bin_response)
    end

    after do
      @response = nil
    end

    describe 'FIELDS' do
      it 'should have the country' do
        _(@response.country).must_equal 'USA'
      end

      it 'should have the product code' do
        _(@response.product).must_equal 'V'
      end

      it 'should have the BIN' do
        _(@response.bin).must_equal '400552'
      end

      it 'should have the cardusestring' do
        _(@response.cardusestring).must_equal 'True credit, No PIN/Signature capability'
      end

      it 'should have the gsa flag' do
        _(@response.gsa).must_equal false
      end

      it 'should have the corporate flag' do
        _(@response.corporate).must_equal false
      end

      it 'should have the fsa flag' do
        _(@response.fsa).must_equal false
      end

      it 'should have the subtype' do
        _(@response.subtype).must_equal 'Visa Traditional'
      end

      it 'should have the purchase flag' do
        _(@response.purchase).must_equal false
      end

      it 'should have the prepaid flag' do
        _(@response.prepaid).must_equal false
      end

      it 'should have the issuer' do
        _(@response.issuer).must_equal 'TEST ISSUER'
      end

      it 'should have the binlo' do
        _(@response.binlo).must_equal '400552XXX'
      end

      it 'should have the binhi' do
        _(@response.binhi).must_equal '400552XXX'
      end
    end

    describe '#success?' do
      it 'should be true when there are no errors' do
        _(@response.success?).must_equal true
      end
    end

    describe '#body' do
      it 'should generate hash with all fields' do
        body = @response.body
        _(body[:country]).must_equal 'USA'
        _(body[:cardusestring]).must_equal 'True credit, No PIN/Signature capability'
        _(body[:prepaid]).must_equal false
      end
    end
  end

  describe 'with empty BIN response (no data found)' do
    before do
      @response = CardConnect::CardPointe::BinResponse.new(empty_bin_response)
    end

    it 'should expose the success flag' do
      _(@response.success).must_equal true
    end

    it 'should expose the errormsg' do
      _(@response.errormsg).must_equal 'No bin information found'
    end

    it 'should leave funding fields nil' do
      _(@response.cardusestring).must_be_nil
      _(@response.prepaid).must_be_nil
    end
  end
end
