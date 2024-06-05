import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';

import { Request } from '@warp-drive/ember';
import { pageTitle } from "ember-page-title";
import Route from "ember-route-template";

import { RequestError } from './components/error';
import { Spinner } from './components/spinner';

function idFor(film) {
  let url = film.url;
  let parts = url.split('/');
  let [,id] = parts.reverse();

  return id;
}

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
          {{#each result.results as |result|}}
            <li>
              <h2>{{result.title}}</h2>
              <LinkTo @route="film" @model={{idFor result}}>View Details</LinkTo>

              <dl>
                <dt>Release Date</dt>
                <dd>{{result.release_date}}</dd>
                <dt>Director</dt>
                <dd>{{result.director}}</dd>
              </dl>
          </li>
          {{/each}}
        </ul>
      </:content>
    </Request>

  </template>
);
