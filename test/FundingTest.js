const Funding = artifacts.require("Funding");

const FINNEY = 10 ** 15;

contract("Funding", accounts => {
  const [firstAccount, secondAccount] = accounts;

  it("sets an owner", async () => {
    const funding = await Funding.new();
    assert.equal(await funding.owner.call(), firstAccount);
  });

  it("owner is not second account", async () => {
    const funding = await Funding.new();
    assert.notEqual(await funding.owner.call(), secondAccount);
  });

  it("accepts donations", async () => {
    const funding = await Funding.new();
    await funding.donate({ from: firstAccount, value: 10 * FINNEY });
    await funding.donate({ from: secondAccount, value: 20 * FINNEY });
    assert.equal(await funding.raised.call(), 30 * FINNEY);
  });

  it("keeps track of donator balance", async () => {
    const funding = await Funding.new();
    await funding.donate({ from: firstAccount, value: 5 * FINNEY });
    await funding.donate({ from: secondAccount, value: 15 * FINNEY });
    await funding.donate({ from: secondAccount, value: 3 * FINNEY });
    assert.equal(await funding.balances.call(firstAccount), 5 * FINNEY);
    assert.equal(await funding.balances.call(secondAccount), 18 * FINNEY);
  });
});
