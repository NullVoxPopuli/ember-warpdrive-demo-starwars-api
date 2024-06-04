import EmberRouter from '@ember/routing/router';

import config from 'my-fancy-app/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('films', function () {
    this.route('show', { path: ":id" });
  });
  this.route('people', function () {
    this.route('show', { path: ":id" });
  });
  this.route('planets', function () {
    this.route('show', { path: ":id" });
  });
  this.route('species', function () {
    this.route('show', { path: ":id" });
  });
  this.route('starships', function () {
    this.route('show', { path: ":id" });
  });
  this.route('vehicles', function () {
    this.route('show', { path: ":id" });
  });
});
