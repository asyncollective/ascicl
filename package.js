// package metadata file for Meteor.js

/* eslint-env meteor */

Package.describe({
  name: 'asyncollective:ascicl', // https://atmospherejs.com/twbs/bootstrap
  summary: 'Internal UI framework at the asyncollective, based on Bootstrap 4.6.2',
  version: '4.0.0',
  git: 'https://github.com/asyncollective/ascicl.git'
})

Package.onUse(api => {
  api.versionsFrom('METEOR@1.0')
  api.use('jquery', 'client')
  api.addFiles([
    'dist/css/ascicl.css',
    'dist/js/ascicl.js'
  ], 'client')
})
