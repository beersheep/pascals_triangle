class Triangle
  attr_reader :rows
  def initialize(rows)
    @rows = []
    rows.times { @rows << [] }
    populate_row(0)
  end

  def populate_row(row)
    if row == 0
      @rows[row] << 1
    else
      push_number_into(row)
    end
    @rows[row][0] = 1
    next_row = row + 1
    populate_row(next_row) if next_row < @rows.size
  end

  def push_number_into(row)
    idx = 0
    prev_row = @rows[row - 1]
    while idx <= row
      last_number = prev_row[idx].nil? ? 0 : prev_row[idx]
      @rows[row] << prev_row[idx - 1] + last_number
      idx += 1
    end
  end
end
