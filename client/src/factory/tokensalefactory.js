export default class TokenSaleFactory {
  constructor(contract) {
    this.contract = contract;
  }

  async _isOwner(from) {
    return await this.contract._isOwner({ from });
  }

  async _tokenSold() {
    return (await this.contract.tokenSold()).toNumber();
  }

  async _totalTokens() {
    return (await this.contract.totalTokens()).toNumber();
  }

  async _endSale(from) {
    return await this.contract.endSale({ from });
  }

  async _buy(from, bnbAmount, tokens) {
    return await this.contract.buy(tokens, { from, value: bnbAmount });
  }

  async _tokens(from) {
    return (await this.contract.__tokens({ from })).toNumber();
  }

  async _tokenPrice() {
    return (await this.contract.__tokenPrice()).toNumber();
  }

  async _currentPhase() {
    let phase = await this.contract.currentPhase();

    return {
      total: phase.total,
      price: phase.price,
      phase: phase.phase,
    };
  }

  async _phase() {
    let phase = await this.contract.phase(phase_id);

    return {
      total: phase.total,
      price: phase.price,
      phase: phase.phase,
    };
  }

  async _phase() {
    let phases = await this.contract.__phases();
    return this.mapPhases(phases);
  }

  mapPhases(phases) {
    return phases.map((phase, phase_id) => {
      return {
        total: phase.total,
        price: phase.price,
        phase: phase.phase,
      };
    });
  }
}
