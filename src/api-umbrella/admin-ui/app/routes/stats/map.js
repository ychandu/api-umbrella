import Base from './base';
import StatsMap from 'api-umbrella-admin/models/stats/map';

export default Base.extend({
  model(params) {
    if(this.validateParams(params)) {
      return StatsMap.find(params);
    } else {
      return {};
    }
  },
});

