# Fundação S.A. - Sistema de Inserção de Pedidos (PI)

Este é um sistema completo para gestão de pedidos de inserção (PI), clientes (PF) e empresas (PJ), com suporte a assinaturas digitais e exportação em PDF.

## 🚀 Tecnologias Utilizadas

- **Frontend:** Next.js 15+, React 19, Tailwind CSS
- **Backend/Database:** Supabase (PostgreSQL)
- **Autenticação:** Supabase Auth (E-mail/Senha)
- **Animações:** Motion (Framer Motion)
- **Ícones:** Lucide React
- **Documentos:** jsPDF, html2canvas

## ⚙️ Configuração do Supabase

Para que o sistema funcione com persistência real, você deve configurar o Supabase:

### 1. Variáveis de Ambiente
Adicione as seguintes chaves no painel de **Secrets** do AI Studio ou no seu arquivo `.env`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anon-publica
```

### 2. Banco de Dados (SQL)
Execute o conteúdo do arquivo `supabase_migration.sql` no **SQL Editor** do seu painel Supabase para criar as tabelas necessárias (`clients`, `companies`, `orders`, `order_items`).

## 🔑 Acesso ao Sistema

- **Modo Demo:** Se o Supabase não estiver configurado, use:
  - **Usuário:** `admin`
  - **Senha:** `fsa123`
- **Modo Real:** Cadastre seu próprio e-mail na tela de login.

## 📄 Funcionalidades Principais

- **Cadastro de Clientes:** Gestão de Pessoa Física e Jurídica.
- **Pedidos de Inserção:** Criação de PIs com múltiplos itens, cálculos automáticos de descontos e totais.
- **Assinatura Digital:** Link exclusivo para o cliente assinar o pedido via navegador.
- **Exportação PDF:** Geração de documentos profissionais prontos para impressão ou envio.
- **Sincronização em Tempo Real:** Dados atualizados instantaneamente entre dispositivos via Supabase.

## 🛠️ Estrutura do Projeto

- `/app`: Rotas e páginas do Next.js.
- `/components`: Componentes reutilizáveis da interface.
- `/lib`: Configurações do Supabase e serviços de dados.
- `/store`: Gerenciamento de estado global (Zustand).
