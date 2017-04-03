var express = require('express');
var router = express.Router();
var databaseModule = require ('./database_module.js');
var bodyParser = require('body-parser');

var query = '';

/* GET users listing. */
router.get('/:userId', function(req, res, next) {
  var userID = req.params.userId;
  var resResult = '';

  query = 'SELECT user_id, inventory.item_id, inventory.amount FROM user INNER JOIN inventory ON inventory.user_id = user_id WHERE user_id IN ({0})';
  query = query.replace('{0}', userID);

  try {
      databaseModule.execute(query, function(result){
      resResult = JSON.stringify(result);
      console.log('OK');
      console.log(resResult);

      res.send(resResult);
      });
  } catch (e) {
    console.log(e);
  }
});

router.post('/:userId', function(req, res, next){
  var userID = req.params.userId;
  var itemID = req.body.itemId;
  var amount = req.body.amount;

  var resResult = '';

  query = 'UPDATE inventory SET amount = {0} WHERE user_id IN ({1}) AND item_id IN ({2});';
  query = query.replace('{0}', amount);
  query = query.replace('{1}', userID);
  query = query.replace('{2}', itemID);

  try {
      databaseModule.execute(query, function(result){
        console.log('query DONE');
      });
    } catch (e) {
    console.log(e);
    }
    res.send('DONE');
  });
module.exports = router;
