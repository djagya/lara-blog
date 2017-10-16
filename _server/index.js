const express = require('express');
const app = express();

const EMAIL = 'danil.kabluk.backup@gmail.com';

app.get('/api/contact', function (req, res) {
  //todo: process payment. send if success.

  res.redirect('http://localhost:4000/contact-success')
});

app.listen(4001, function () {
  console.log('Example app listening on port 4001!')
});
