import { on } from '@ember/modifier';

import { Request } from '@warp-drive/ember';
import { pageTitle } from "ember-page-title";
import Route from "ember-route-template";

import { RequestError } from './components/error';
import { Spinner } from './components/spinner';

export default Route(
  <template>
    <Request @request={{@model.request}}>
      <:loading as |state|>
        <Spinner @percentDone={{state.completedRatio}} />
        <button type="button" {{on "click" state.abort}}>Cancel</button>
      </:loading>

      <:error as |error state|>
        <RequestError @error={{error}} @state={{state}} />
      </:error>

      <:content as |result|>
        {{pageTitle result.title}}

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
