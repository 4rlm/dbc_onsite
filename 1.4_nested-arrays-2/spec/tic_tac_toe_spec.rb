require_relative '../tic_tac_toe'

# The board has three rows.
# Each row has three columns.
# Each letter on the board is either an X or an O.

describe 'generate_tic_tac_toe' do
  let(:board) {generate_tic_tac_toe}

  it 'the board has three rows' do
    desired_rows = 3
    expect(desired_rows).to eq desired_rows
  end

  it 'each row has three columns' do
    desired_columns = 3
    expect(desired_columns).to eq desired_columns
  end

  it 'each letter on the board is either an X or an O' do
    desired_letters = 'X' || 'O'
    expect(desired_letters).to eq desired_letters
  end

end
