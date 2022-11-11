# HBG local search

[![Code Climate](https://codeclimate.com/github/clarat-org/clarat/badges/gpa.svg)](https://codeclimate.com/github/clarat-org/clarat) [![Build Status](https://travis-ci.org/clarat-org/clarat.svg?branch=master)](https://travis-ci.org/clarat-org/clarat) [![Coverage Status](https://coveralls.io/repos/clarat-org/clarat/badge.svg?branch=master&service=github)](https://coveralls.io/github/clarat-org/clarat?branch=master)

A directory of services for refugess and newcomers in Germany.

All software in this platform is released under the [MIT license](LICENSE). For the avoidance of doubt, all content, in particular without being limited to, text modules, documents, images and logos containing trademarks belonging to Benckiser Stiftung Zukunft, gut.org gAG or Neue deutsche Medienmacher*innen e.V. remains unaffected therefrom and is subject to the applicable legal provisions.

This software uses a variety of external services to enhance User experience, including but not limited to newsletter subscriptions via Mailchimp, automated mailings via SendGrid, the [Google Translate API](https://cloud.google.com/translate/docs/) for automated translations, and the Google Geocoding API.

## Local dev

- `cp example.env .env` then edit .env

Required: `LOCALEAPP_API_KEY`, `DATABASE_URL`, `ALGOLIA_ID`, `ALGOLIA_KEY`, `ALGOLIA_PUB`. Set `FORCE_PRODUCTION_INDEX=true` to get results from production database.

- Build Docker Image, create and run Container

```bash
docker build -t hbg-local-dev .
docker run -d -p 3000:3000 -v ${PWD}:/opt/hbg-local --name hbg-local-dev hbg-local-dev:latest
```

- Access at http://127.0.0.1:3000/
