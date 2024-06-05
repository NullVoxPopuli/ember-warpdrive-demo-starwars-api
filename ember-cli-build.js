'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');
const { maybeEmbroider } = require('@embroider/test-setup');

module.exports = async function (defaults) {
  const { setConfig } = await import('@warp-drive/build-config');

  // For Debugging build macros
  // Everything is on the "default" export...
  //const {
  //  default: { MacrosConfig },
  //} = await import('@embroider/macros/src/node.js');

  const app = new EmberApp(defaults, {
    'ember-cli-babel': {
      throwUnlessParallelizable: true,
      enableTypeScriptTransform: true,
    },
  });

  setConfig(app, __dirname, {
    compatWith: '99.0',
  });

  //let macros = MacrosConfig.for(app, __dirname);
  //
  //let warpDriveConfig = macros.globalConfig['WarpDrive'];

  return maybeEmbroider(app, {
    skipBabel: [
      {
        package: 'qunit',
      },
    ],
  });
};
