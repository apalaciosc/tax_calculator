# Getting Started

This ruby module is used to calculate taxes and totals following some rules:

- Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt.
- Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

## Dependencies

Recommended Ruby version: >= 2.75

## Run Rspec tests

**(After install some ruby version)**

1. Clone the repository.
2. Install bundler: `gem install bundler -v 2.3.10`
3. `bundle install --path .bundle`
4. `rspec`

<img width="485" alt="Screen Shot 2023-02-26 at 01 40 37" src="https://user-images.githubusercontent.com/35356671/221396218-18837e21-fbe4-46aa-8bfa-cce86933691a.png">

## Test Project:

1. Run: ` irb -r ./tax_calculator.rb`

Execute class method in `irb` console:

For Example:
```
TaxCalculator.new("2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85").run!
```

## Previews

<img width="774" alt="Screen Shot 2023-02-26 at 01 42 32" src="https://user-images.githubusercontent.com/35356671/221396288-b59659fd-414f-483d-b119-11179a50fb1d.png">

<img width="871" alt="Screen Shot 2023-02-26 at 01 43 48" src="https://user-images.githubusercontent.com/35356671/221396332-92b9eb77-0626-4417-b4de-6691808dc648.png">


<img width="1346" alt="Screen Shot 2023-02-26 at 01 44 16" src="https://user-images.githubusercontent.com/35356671/221396344-cb18caa8-cc90-4e27-bc64-1e93d8a0bdc8.png">

