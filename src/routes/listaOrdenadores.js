const express = require('express');
const router = express.Router();

router.get('/lista-ordenadores', (req, res) => {
  res.render('ordenadores/ordenadoresList');
});

module.exports = router;