import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hello from a container!",
    timestamp: new Date().toISOString(),
    service: "Hello node",
    pod: process.env.POD_NAME || "unknown",
  });
});

app.get("/readyz", (req, res) => {
  res.status(200).send("Ready");
});

app.get("/healthz", (req, res) => {
  res.status(200).send("Ok");
});

// IMPORTANT: Listen on 0.0.0.0 for Kubernetes
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Example app listening on port ${PORT}!`);
});
