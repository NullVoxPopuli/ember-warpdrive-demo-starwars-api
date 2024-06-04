import Component from '@glimmer/component';

export default class Battle extends Component {
  get date() {
    return new Intl.DateTimeFormat().format(this.args.model.date);
  }

  <template>
    <div class="card" ...attributes>
      <div class="card-header">
        <LinkTo data-test-link @route="battle" @model={{@model}} >{{@model.name}} / {{this.date}}</LinkTo>
      </div>
      <div class="card-body">
        <div class="card-text">Winner: <span class="badge bg-success" data-test-winner-name>{{@model.winner.name}}</span></div>

        <div class="row mt-4">
          {{#each @model.battlables as |battlable|}}
            <div class="col-sm-6">
              <Ui::Cart @model={{battlable}} />
            </div>
          {{/each}}
        </div>
      </div>
    </div>
  </template>
}
