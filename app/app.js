import Application from '@ember/application';
import { setBuildURLConfig } from '@ember-data/request-utils';

import loadInitializers from 'ember-load-initializers';
import Resolver from 'ember-resolver';
import config from 'my-fancy-app/config/environment';

setBuildURLConfig({
  host: 'https://swapi.dev',
  namespace: 'api',
});

export default class App extends Application {
  modulePrefix = config.modulePrefix;
  podModulePrefix = config.podModulePrefix;
  Resolver = Resolver;
}

loadInitializers(App, config.modulePrefix);
