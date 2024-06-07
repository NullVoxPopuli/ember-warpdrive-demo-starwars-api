import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';

import { Request } from '@warp-drive/ember';
import { pageTitle } from "ember-page-title";
import Route from "ember-route-template";

import { RequestError } from './components/error';
import { Spinner } from './components/spinner';

export default Route(
  <template>
    {{pageTitle "Films"}}

    <Request @request={{@model.request}}>
      <:loading as |state|>
        <Spinner @percentDone={{state.completedRatio}} />
        <button type="button" {{on "click" state.abort}}>Cancel</button>
      </:loading>

      <:error as |error state|>
        <RequestError @error={{error}} @state={{state}} />
      </:error>

      <:content as |result|>
        <ul>
          {{#each result.data as |result|}}
            <li>
              <h2>{{result.attributes.title}}</h2>
              <LinkTo @route="film" @model={{result.id}}>View Details</LinkTo>

              <dl>
                <dt>Release Date</dt>
                <dd>{{result.attributes.release_date}}</dd>
                <dt>Director</dt>
                <dd>{{result.attributes.director}}</dd>
              </dl>
          </li>
          {{/each}}
        </ul>
      </:content>
    </Request>

  </template>
);
