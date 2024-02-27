const fs = require('fs')
const DB_HOST=process.argv[2]
const DB_USER=process.argv[3]
const DB_PASS=process.argv[4]
const DB_NAME=process.argv[5]
const DB_SSL=process.argv[6]
const DB_PORT=process.argv[7]

console.log(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_SSL, DB_PORT)    

let data=fs.readFileSync("config.yml").toString()

data=data.replace("{0}",DB_HOST)
data=data.replace("{1}",DB_USER)
data=data.replace("{2}",DB_PASS)
data=data.replace("{3}",DB_NAME)
data=data.replace("{4}",DB_SSL)
data=data.replace("{5}",DB_PORT)

fs.writeFileSync("config.yml", data)