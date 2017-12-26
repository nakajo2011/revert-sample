const Callee = artifacts.require('Callee.sol')
const RevertSample = artifacts.require('RevertSample.sol')

contract('RevertSampleTest', (accounts) => {
  describe("#countup()", () => {
    it.only("should assert true", async () => {
      let callee = await Callee.new();
      let instance = await RevertSample.new(callee.address);
      let result = await instance.counter()
      let errormsg = await instance.message()
      assert.equal(0, result.toNumber())
      assert.equal("", errormsg)

      await instance.hoge()
      await instance.hoge()
      result = await callee.counter()
      errormsg = await instance.message()
      assert.equal(2, result.toNumber())
      assert.equal("", errormsg)

      await instance.hoge()
      errormsg = await instance.message()
      assert.equal("over count!", errormsg)
    });
  })
});
