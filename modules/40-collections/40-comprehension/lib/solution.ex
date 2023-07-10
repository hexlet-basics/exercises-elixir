defmodule Solution do
  # BEGIN
  def fetch_gamers(employees) do
    for employee <- employees,
        employee.status == :active,
        hobby <- employee.hobbies,
        hobby.type == :gaming do
      {employee.name, hobby}
    end
  end

  # END
end
