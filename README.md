# Import [Mitro](https://www.mitro.co/) CSV files into [KeepassX](https://www.keepassx.org/)

I used Keepass for years but then Mitro came along and sounded great so I jumped in and started using that.
Bad move, they're [shutting down](https://www.mitro.co/shutdown.html).

You can only export passwords from Mitro in CSV and you can only import files into KeepassX using their XML format.
So I wrote this really hacky script to convert Mitro CSV files into a format that can be imported into KeepassX.

## Usage

`./convert.rb some_file.csv another_file.xml`
