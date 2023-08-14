defmodule Test do
  use ExUnit.Case

  describe "parse work" do
    test "with valid input" do
      text = "hello\nworld!"

      assert TextParser.parse(text) == {:ok, ["hello", "world!"]}

      text = "some"

      assert TextParser.parse(text) == {:ok, ["some"]}

      text =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer commodo condimentum nulla sed aliquet. Donec sit amet euismod nulla, sed aliquam lacus. Maecenas dignissim ante eu gravida pellentesque. Ut hendrerit tellus ut facilisis convallis. Mauris ultrices quam in lectus condimentum semper. Aenean mi lectus, ornare quis mauris ut, convallis imperdiet erat. Proin pharetra sapien mauris, quis faucibus purus malesuada vel. Fusce sagittis et nisl quis pharetra. Duis ut erat tincidunt enim porttitor pulvinar sed sit amet ligula.\nSuspendisse potenti. Proin vel massa quam. Etiam dapibus ex in tincidunt congue. Nullam lorem enim, mollis id volutpat suscipit, dapibus vel metus. Nulla eget metus enim. Duis faucibus urna turpis, vitae auctor turpis blandit a. Proin diam eros, tempor non lorem ut, placerat placerat massa. Integer sagittis dictum ex, vestibulum lacinia metus sagittis vitae. Praesent mollis nibh sed sollicitudin iaculis. Vestibulum condimentum ut metus ut dapibus. Donec ut felis rutrum, maximus arcu sed, semper libero. Cras hendrerit diam et auctor suscipit. Nam nec lobortis nisi. Fusce ligula augue, tempor bibendum ex volutpat, luctus volutpat leo. Sed eu pretium lectus, vitae vestibulum eros.\nSed suscipit lobortis dolor, eu ultricies purus volutpat eu. Integer luctus erat eu metus cursus, in porta ex ullamcorper. Morbi et urna eget lorem gravida maximus at quis mi. Etiam auctor ultricies nunc eu convallis."

      assert TextParser.parse(text) ==
               {:ok,
                [
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer commodo condimentum nulla sed aliquet. Donec sit amet euismod nulla, sed aliquam lacus. Maecenas dignissim ante eu gravida pellentesque. Ut hendrerit tellus ut facilisis convallis. Mauris ultrices quam in lectus condimentum semper. Aenean mi lectus, ornare quis mauris ut, convallis imperdiet erat. Proin pharetra sapien mauris, quis faucibus purus malesuada vel. Fusce sagittis et nisl quis pharetra. Duis ut erat tincidunt enim porttitor pulvinar sed sit amet ligula.",
                  "Suspendisse potenti. Proin vel massa quam. Etiam dapibus ex in tincidunt congue. Nullam lorem enim, mollis id volutpat suscipit, dapibus vel metus. Nulla eget metus enim. Duis faucibus urna turpis, vitae auctor turpis blandit a. Proin diam eros, tempor non lorem ut, placerat placerat massa. Integer sagittis dictum ex, vestibulum lacinia metus sagittis vitae. Praesent mollis nibh sed sollicitudin iaculis. Vestibulum condimentum ut metus ut dapibus. Donec ut felis rutrum, maximus arcu sed, semper libero. Cras hendrerit diam et auctor suscipit. Nam nec lobortis nisi. Fusce ligula augue, tempor bibendum ex volutpat, luctus volutpat leo. Sed eu pretium lectus, vitae vestibulum eros.",
                  "Sed suscipit lobortis dolor, eu ultricies purus volutpat eu. Integer luctus erat eu metus cursus, in porta ex ullamcorper. Morbi et urna eget lorem gravida maximus at quis mi. Etiam auctor ultricies nunc eu convallis."
                ]}
    end

    test "with invalid input" do
      assert TextParser.parse("") == {:error, :no_text}
    end
  end

  test "extensions work" do
    assert TextParser.extensions() == [".txt"]
  end
end
