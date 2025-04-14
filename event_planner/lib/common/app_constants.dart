class AppConstants {
  static List<Map<String, String>> organizers = [
    {
      'name': 'James Anderson',
      'email': 'james.anderson@example.com',
      'image':
          'https://s3-alpha-sig.figma.com/img/5824/acac/b3b76175bc84084ec18597109498f96d?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=exlFzi3NtJl6nKlH-32UoP3aEt0z10puQMLm5DxTytjOu~q6B1OJitRxQAgHcPNA4~kisz0BYLiND1ic7~3kcdMoGXwLlUKs4vCAK8YvOEdlWCIYIRA7XUzw9uSJERZHQMW63cJYPMGaHK6fCAAWCDmcHj11~NM29eINuOYWxMAFL7zNxFDN21xSpCdN6M1Q802yGffTEg1PhfbraRMNfyVE5iAOZiruVLddFIZrn4Ad26FfUbzXux-gjFJ4rgvsfg1HTkIyfHasQ10jui~RkY0rD3ct4g2DZOPdP~Wq765EXXuUzHhT9LDXCHIzAHIvYg7LOs7asZyKB1WJkQbjyA__',
    },
    {
      'name': 'Jane Doe',
      'email': 'jane.doe@example.com',
      'image':
          'https://s3-alpha-sig.figma.com/img/a3e9/4295/c50672e8cea85c2f3a79070a8585d305?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=MRIfkasaIWbtR83hXfFI20m5RxdLTTQxHcQFZBVIcOV4xf9COlEiFIMTvXZclLKBr~1a8FDkgF8N~Gzp1GE3Wc1AYjOfChmZxB2eF01-Qbd0MKkmB1pKaFdigeSHx333cyxBpgJCSRLQ5T6urgoZdoCbJ4CJWcBaWI60yqAHgxr8bqyNVcOsDMlsl99cca70Tu6X33POJxSNj1ceQuMIUc2PGKz7LsKfNq2XSAViSudYZhcmKS9q7T-9QB5Q2ZQ3Oh954qG97yDS2TxLghJnAKe5vxt2Z7zZxZP~n9M42WjUVK9hRXw0K1Az9e6-UAuNtp~QK2RZ-tVkxzAuVo1GTA__',
    },
    {
      'name': 'Evelyn Sinai',
      'email': 'evelyn.sinai@example.com',
      'image':
          'https://s3-alpha-sig.figma.com/img/bb5a/b1e2/6f5aebe7f96f23f10603fcdf8c868631?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=GI8GnqbycxMmUgw0gTJ5-vrYEO-nlH8qQp0R8llxqDJYt0o9QqZwKecY3R9d5jzxFAvVh3EJdBrZhk4pQiRjtEMeswncDr1lSeWbJ1IqwujMc5SAXzS5I7h-5~w1iSpqwubIaNGjsJod723LSoAwjX0lX5ZrVjXGM3ffLmmOl18ojb1Ii9lPUC074ybRqg4IbwcGM2bBjsw3nia4EdPgz-jItH4BrUpWB5VH0hsqoIdZdwqx7naYHj7oGg8VOOnjCAFiaHBT8J-teHFCROHi9TSfIDr32K~ZjL1rq0iiQvqjKueiUHXrL9saDJ1cKi2XQCTAtkaVBI48rtPTQtsK5w__',
    },
  ];

  static List<Map<String, String>> posts = [
    {
      'title': 'COVID-19 updaten',
      'description': 'Anyone with symptoms should be tested, wherever possible. People who do not have symptoms but have had close...',
      'image':
          'https://s3-alpha-sig.figma.com/img/8aab/0d8a/db50e301656223bd94783b2cf6a32c17?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=jjiiDq~dln29ll1q1RPhVd4lfYtN-nAy51PYV9AAviI1bR21d9vA6JSCNBqOvY5nNPWDamiOUPFgYV7Jp7YYK~uclXXJLZN52sW-KkyB4szGkfoud0zXSlV9CcDZhErzADOHwx5HJdKbCtmXCMjKQq8RMAZ8X6~7vFgvmd3mSy9UmfouxmWt-LaafqT9taXevNKC-p5hwdRSJMG08IGnvV2IbpoC7ArzJA0H5AdC5aOeHcvGzECP-eNdVw-C8Sr5UVQsOgtml~EznMAW-rQqekZqdlxQ5R6pzRRj-LSwUBGKddXGuufTQt5KtlO72pp~fZrbdjLitQpf2dtPFHCThA__',
    },
    {
      'title': 'Alert',
      'description': 'Cranes will be operating outside the foyer on Weds April 27th. Please take extra cautions when entering and...',
      'image':
          'https://s3-alpha-sig.figma.com/img/6b90/d3a4/19a04a3e2e4ecbff453e98b9add5355b?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ExwFPyP3seDNUs9ldoxWRvIbYq-h4V2S94JA8l4G~eI2hBcGHo0GV77Hm98N-ZKVBqT2LlhPQ2J1p~OXHIJcwoXcNga2UUeqh41P~uJXkGmTa5dBYguzyu4qjH0oZlMZx4PdKbFNCH7K4WUmKwUzy54aStdhMrVun9M7f9KwimtxKFH9Si-Qqr3OSpqkCnRf4np-aSpEn2WtWc97ZjMMNRb45I0NbQQccY-g23vgkpC7rpoHq3qeACLJEsQVvooG8FvUzkQ0wlVoHW~UrYLHYO-8SxzxW9w9WoZ~~0eq7pqTReroh6G3BAyJuId43RXm27~NsHoS9StRY5p296RKCg__',
    },
    {
      'title': 'COVID-19 update',
      'description': 'Anyone with symptoms should be tested, wherever possible. People who do not have symptoms but have had close...',
      'image':
          'https://s3-alpha-sig.figma.com/img/8aab/0d8a/db50e301656223bd94783b2cf6a32c17?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=jjiiDq~dln29ll1q1RPhVd4lfYtN-nAy51PYV9AAviI1bR21d9vA6JSCNBqOvY5nNPWDamiOUPFgYV7Jp7YYK~uclXXJLZN52sW-KkyB4szGkfoud0zXSlV9CcDZhErzADOHwx5HJdKbCtmXCMjKQq8RMAZ8X6~7vFgvmd3mSy9UmfouxmWt-LaafqT9taXevNKC-p5hwdRSJMG08IGnvV2IbpoC7ArzJA0H5AdC5aOeHcvGzECP-eNdVw-C8Sr5UVQsOgtml~EznMAW-rQqekZqdlxQ5R6pzRRj-LSwUBGKddXGuufTQt5KtlO72pp~fZrbdjLitQpf2dtPFHCThA__',
    },
  ];
}
