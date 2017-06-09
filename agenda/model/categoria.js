var database = require('./database');
var categoria = {};

categoria.selectAll = function(callback) {
  if(database) {
    database.query("SELECT * FROM Categoria",
    function(error, resultados) {
      if(error) {
        throw error;
      } else {
        callback(null, resultados);
      }
    });//Fin query
  }//Fin IF
}//FIN SelectAll

categoria.select = function(idCategoria, callback) {
  if(database) {
    var sql = "SELECT * FROM Categoria WHERE idCategoria = ?";
    database.query(sql, idCategoria,
    function(error, resultado) {
      if(error) {
        throw error;
      } else {
        callback(null, resultado);
      }
    });//Fin query
  }//Fin IF
}//FIN SelectAll

categoria.insert = function(data, callback) {
  if(database) {
    database.query("INSERT INTO Categoria SET ? ", data,
    function(error, resultado) {
      if(error) {
        throw error;
      } else {
        callback(null, {"insertId": resultado.insertId});
      }
    });//Fin query
  }//Fin IF
}//FIN SelectAll

categoria.update = function(data, callback) {
  if(database) {
    var sql = "UPDATE Categoria SET "
    +"nombreCategoria = ? WHERE idCategoria = ?";
    database.query(sql,
    [data.nombreCategoria, data.idCategoria],
    function(error, resultado) {
      if(error) {
        throw error;
      } else {
        callback(null, {"insertId": resultado.insertId});
      }
    });//Fin query
  }//Fin IF
}//FIN SelectAll

categoria.delete = function(idCategoria, callback) {
  if(database) {
    var sql = "DELETE FROM Categoria WHERE idCategoria = ?";
    database.query(sql, idCategoria,
    function(error, resultado) {
      if(error) {
        throw error;
      } else {
        callback(null, {"Mensaje": "Eliminado"});
      }
    });//Fin query
  }//Fin IF
}//FIN SelectAll


module.exports = categoria;
