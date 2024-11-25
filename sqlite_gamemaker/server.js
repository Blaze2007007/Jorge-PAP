const express = require("express");

const app = express();
app.use(express.json());  // Fixed: Added missing parentheses

const sqlite3 = require("sqlite3").verbose();

const dbname = "game.db";

const db = new sqlite3.Database(dbname, (err) => {
  if (err) {
    console.error(err.message);
  } else {
    console.log(`Connected to the database '${dbname}'.`);
  }
});

app.post("/Jogadores/", (req, res) => {  // Fixed: Corrected route definition
  let sql = `INSERT INTO Jogadores (Jogador, Personagem, Posicao_x, Posicao_y)
             VALUES (?, ?, ?, ?)`;
  let params = [
    req.body.Jogador,
    req.body.Personagem,
    req.body.Posicao_x,
    req.body.Posicao_y,
  ];

  db.run(sql, params, function(err) {  // Use function() to access this.lastID
    if (err) {
      console.error(err.message);
      res.status(500).send("Error adding jogador");
      return;
    }
    console.log(`Jogador added with ID ${this.lastID}`);

    // Fetch the ID of the newly inserted jogador
    sql = `SELECT Id FROM Jogadores WHERE Jogador = ?`;
    params = [req.body.Jogador];
    
    db.get(sql, params, (err, row) => {
      if (err) {
        console.error(err.message);
        res.status(500).send("Error retrieving jogador ID");
        return;
      }
      res.send(row.Id.toString());
    });
  });
});

const server = app.listen(8080, () => {
  console.log(`Listening at http://localhost:8080`);

  const sql = `CREATE TABLE IF NOT EXISTS Jogadores (
                Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                Jogador NVARCHAR(50) NOT NULL,
                Personagem NVARCHAR(50) NOT NULL,
                Posicao_x INTEGER NOT NULL,
                Posicao_y INTEGER NOT NULL
              );`;

  db.run(sql, [], (err) => {
    if (err) {
      console.error("Error creating table:", err.message);
    } else {
      console.log("Jogadores table ready.");
    }
  });
});
