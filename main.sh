#!/bin/bash
remove="uptime-kuma CNAME *.md install.sh .git .github .dockerignore .gitignore LICENSE .editorconfig .eslintrc.js .stylelintrc"
git clone https://github.com/louislam/uptime-kuma.git
mv -f uptime-kuma/* ./
mv -f uptime-kuma/.[^.]* ./
rm -rf $remove
npm install npm -g
npm ci --production
npm run download-dist
echo 'require("./server/server.js");' > index.js
node index.js
