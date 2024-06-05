import { on } from '@ember/modifier';

export const RequestError = <template>
  <p>
    {{@error}}
  </p>

  <button type="button" {{on "click" @state.retry}}>Retry</button>
</template>;
