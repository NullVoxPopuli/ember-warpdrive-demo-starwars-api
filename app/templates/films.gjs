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
    {{ (pageTitle "Films") }}

    <Request @request={{@model.request}}>
      <:loading as |state|>
        <Spinner @percentDone={{state.completedRatio}} />
        <button {{on "click" state.abort}}>Cancel</button>
      </:loading>

      <:error as |error state|>
        <RequestError @error={{error}} @state={{state}} />
      </:error>

      <:content as |result|>
        <ul>
          {{#each result.results as |result|}}
          {{log result}}
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
