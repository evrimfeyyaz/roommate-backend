shared_examples_for 'a tenant model' do
  context 'when no tenant is set' do
    it 'raises an error' do
      current_tenant              = ActsAsTenant.current_tenant
      ActsAsTenant.current_tenant = nil

      expect {
        described_class.first
      }.to raise_error(ActsAsTenant::Errors::NoTenantSet)

      ActsAsTenant.current_tenant = current_tenant
    end
  end
end