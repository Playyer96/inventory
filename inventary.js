var pg = require ('pg');
var client = new pg.Client();

client.connect(function (err) {
  if(err) throw err;

  client.query('SELECT $1:: item as integer', ['amount'], function (err, result){
      if (err) throw err;
      console.log(result.row[0]);
      client.end(function (err) {
        if(err) throw err;
      });
  });
});
