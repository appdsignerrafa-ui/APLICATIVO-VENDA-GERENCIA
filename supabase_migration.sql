-- 1. Tabela de Clientes (Pessoa Física)
CREATE TABLE IF NOT EXISTS clients (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  cpf TEXT,
  rg TEXT,
  cep TEXT,
  address TEXT,
  phone TEXT,
  phone2 TEXT,
  email TEXT,
  email2 TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Tabela de Empresas (Pessoa Jurídica)
CREATE TABLE IF NOT EXISTS companies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_name TEXT NOT NULL,
  trade_name TEXT NOT NULL,
  cnpj TEXT,
  state_registration TEXT,
  municipal_registration TEXT,
  cep TEXT,
  address TEXT,
  contact_person TEXT,
  phone TEXT,
  phone2 TEXT,
  email TEXT,
  email2 TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Tabela de Pedidos (PI)
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_number SERIAL UNIQUE,
  customer_id UUID NOT NULL,
  customer_type TEXT NOT NULL CHECK (customer_type IN ('PF', 'PJ')),
  subtotal NUMERIC(12, 2) NOT NULL DEFAULT 0,
  total_discount NUMERIC(12, 2) NOT NULL DEFAULT 0,
  total_amount NUMERIC(12, 2) NOT NULL DEFAULT 0,
  payment_method TEXT,
  payment_conditions TEXT,
  tipo_grade TEXT,
  fixed_payment_day INTEGER,
  due_date DATE,
  signature TEXT,
  signed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Tabela de Itens do Pedido
CREATE TABLE IF NOT EXISTS order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  emissora TEXT,
  tipo TEXT,
  periodicidade TEXT,
  description TEXT NOT NULL,
  start_date DATE,
  end_date DATE,
  days INTEGER,
  monthly_price NUMERIC(12, 2),
  quantity INTEGER NOT NULL DEFAULT 1,
  unit_price NUMERIC(12, 2) NOT NULL DEFAULT 0,
  discount NUMERIC(12, 2) NOT NULL DEFAULT 0,
  total NUMERIC(12, 2) NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. Habilitar Segurança (RLS)
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE companies ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;

-- 6. Criar Políticas de Acesso Público (Permitir leitura/escrita para todos - Ajuste conforme necessário)
CREATE POLICY "Allow all" ON clients FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all" ON companies FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all" ON orders FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all" ON order_items FOR ALL USING (true) WITH CHECK (true);
