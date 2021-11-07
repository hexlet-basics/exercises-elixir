%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["modules/**/lib", "modules/**/test"],
        excluded: []
      },
      checks: [
        {Credo.Check.Readability.ModuleDoc, false},
        {Credo.Check.Refactor.CyclomaticComplexity, false},
      ]
    }
  ]
  }
