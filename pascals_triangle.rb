class Triangle
  attr_reader :rows
  def initialize(rows)
    @rows = []
    rows.times { @rows << [] }
    populate_row(rows)
  end

  def populate_row(rows)
    nth_row = @rows.size - rows
    if nth_row == 0
      @rows[nth_row] << 1 if nth_row == 0
    else
      idx = 0
      last_row = @rows[nth_row - 1]
      while idx <= nth_row
        last_number = last_row[idx].nil? ? 0 : last_row[idx]
        @rows[nth_row] << last_row[idx - 1] + last_number
        idx += 1
      end
    end
    @rows[nth_row][0] = 1
    next_row = rows - 1
    populate_row(next_row) if next_row > 0
  end
end
