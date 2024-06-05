import { pageTitle } from "ember-page-title";
import { LinkTo } from '@ember/routing';
import { on } from '@ember/modifier';
import Route from "ember-route-template";
import { Request } from '@warp-drive/ember';

import { Spinner } from './components/spinner';
import { RequestError } from './components/error';

function idFor(film) {
  let url = film.url;
  let parts = url.split('/');
  let [,id] = parts.reverse();

  return id;
}

export default Route(
  <template>
    <Request @request={{@model.request}}>
      <:loading as |state|>
        <Spinner @percentDone={{state.completedRatio}} />
        <button {{on "click" state.abort}}>Cancel</button>
      </:loading>

      <:error as |error state|>
        <RequestError @error={{error}} @state={{state}} />
      </:error>

      <:content as |result|>
        {{ (pageTitle result.title) }}

        <dl>
          {{#each-in result as |key value|}}
            <dt>{{key}}</dt>
            <dd>{{value}}</dd>
          {{/each-in}}
        </dl>
      </:content>
    </Request>

  </template>
);
