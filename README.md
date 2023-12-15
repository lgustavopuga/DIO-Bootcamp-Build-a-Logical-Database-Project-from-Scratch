# Projeto: Construção de um Projeto Lógico de Banco de Dados do Zero

Este repositório contém um projeto dedicado à construção de um banco de dados para uma oficina mecânica de automóveis. O processo é dividido em cinco etapas principais, cada uma com seus objetivos específicos.

## Etapa 1: Análise do Esquema Conceitual

Na primeira etapa, realizamos uma análise do esquema conceitual para identificar entidades, atributos e relacionamentos relevantes. Aqui estão algumas orientações:

### Entidades Principais:
- Cliente
- Veículo
- Serviço
- Peça
- Funcionário

### Relacionamentos:
- Cliente <-> Veículo
- Veículo <-> Serviço
- Serviço <-> Peça
- Serviço <-> Funcionário

### Cardinalidade:
- Cliente (1) <-> (N) Veículo
- Veículo (1) <-> (N) Serviço
- Serviço (N) <-> (N) Peça
- Serviço (N) <-> (N) Funcionário

### Atributos Derivados:
- Custo total de um serviço (somando o custo de todas as peças utilizadas).

### Atributos Multivalorados:
- Telefones de contato de um cliente.

### Identificadores Únicos:
- ID_cliente, ID_veículo, ID_serviço, etc.

### Normalização:
- Considerar a normalização para eficiência e integridade do banco de dados.

## Etapa 2: Mapeamento do Esquema Conceitual para o Lógico

Nesta etapa, traduzimos o esquema conceitual para um modelo relacional, criando tabelas e definindo relações:

### Exemplo do esquema lógico:
Veja o exemplo de [esquema lógico](#etapa-2-mapeamento-do-esquema-conceitual-para-o-lógico).

**Etapa 2: Mapeamento do Esquema Conceitual para o Lógico**

Nesta etapa, você irá traduzir o esquema conceitual para o modelo relacional, criando as tabelas e definindo as relações entre elas.

1. **Cliente:**
   - Tabela: Cliente
     - Atributos: ID_cliente (PK), Nome, Endereco, Telefone, etc.

2. **Veículo:**
   - Tabela: Veiculo
     - Atributos: ID_veiculo (PK), ID_cliente (FK), Modelo, Placa, Ano, etc.

3. **Serviço:**
   - Tabela: Servico
     - Atributos: ID_servico (PK), Desricao, Custo, Data, etc.

4. **Peça:**
   - Tabela: Peca
     - Atributos: ID_peca (PK), Nome, Estoque, Preco, etc.

5. **Funcionário:**
   - Tabela: Funcionario
     - Atributos: ID_funcionario (PK), Nome, Cargo, Salario, etc.

6. **Relacionamentos:**
   - Cliente (1) <-> (N) Veiculo
     - Chave estrangeira: ID_cliente em Veiculo referenciando ID_cliente em Cliente.
   - Veiculo (1) <-> (N) Servico
     - Chave estrangeira: ID_veiculo em Servico referenciando ID_veiculo em Veiculo.
   - Servico (N) <-> (N) Peça (N:N)
     - Cria uma tabela de junção (por exemplo, Servico_Peca) com ID_servico e ID_peca.
   - Servico (N) <-> (N) Funcionario (N:N)
     - Cria uma tabela de junção (por exemplo, Servico_Funcionario) com ID_servico e ID_funcionario.

7. **Ajustes:**
   - Certifique-se de definir as chaves primárias e estrangeiras corretamente.
   - Considere a normalização para evitar redundância e garantir a integridade dos dados.
   - Decida sobre o uso de atributos derivados e multivalorados, se aplicável.

Exemplo do esquema lógico:

```plaintext
Cliente
| ID_cliente | Nome     | Endereco         | Telefone     |
|------------|----------|------------------|--------------|
| 1          | Cliente1 | Endereco1        | 123-456-7890 |
| 2          | Cliente2 | Endereco2        | 987-654-3210 |
...

Veiculo
| ID_veiculo | ID_cliente | Modelo   | Placa   | Ano  |
|------------|------------|----------|---------|------|
| 1          | 1          | Carro1   | ABC123  | 2019 |
| 2          | 1          | Carro2   | XYZ789  | 2020 |
...

Servico
| ID_servico | Descricao         | Custo | Data       |
|------------|-------------------|-------|------------|
| 1          | Troca de óleo     | 50.00 | 2023-01-01 |
| 2          | Troca de pneus    | 100.00| 2023-01-05 |
...

Peca
| ID_peca | Nome     | Estoque | Preco |
|---------|----------|---------|-------|
| 1       | Peca1    | 50      | 10.00 |
| 2       | Peca2    | 30      | 20.00 |
...

Funcionario
| ID_funcionario | Nome       | Cargo        | Salario |
|----------------|------------|--------------|---------|
| 1              | Func1      | Mecânico     | 2000.00 |
| 2              | Func2      | Atendente    | 1500.00 |
...

Servico_Peca (Tabela de junção)
| ID_servico | ID_peca |
|------------|---------|
| 1          | 1       |
| 1          | 2       |
| 2          | 2       |
...

Servico_Funcionario (Tabela de junção)
| ID_servico | ID_funcionario |
|------------|----------------|
| 1          | 1              |
| 2          | 1              |
| 2          | 2              |
...
```

Depois de criar esse mapeamento, você pode passar para a próxima etapa, que é a criação do script SQL para criar o esquema do banco de dados.

## Etapa 3: Criação do Script SQL

Aqui está um exemplo básico de script SQL para criar o esquema do banco de dados:

```sql
-- Consulte o script SQL na seção correspondente para criar o banco de dados.
```

## Etapa 4: Persistência de Dados

Após criar o esquema, inserimos dados de exemplo nas tabelas para realizar testes. Consulte o script SQL na seção correspondente para exemplos de inserção.

## Etapa 5: Criação de Queries

Desenvolvemos queries SQL para operações mais complexas no banco de dados, permitindo uma análise mais aprofundada. Consulte a seção correspondente para exemplos de queries.

---

### Observações:

- Certifique-se de ajustar os scripts conforme necessário para atender às necessidades específicas do seu projeto.
- Execute os scripts em seu sistema de gerenciamento de banco de dados para criar o esquema e persistir dados.
- As queries fornecidas são exemplos; personalize-as conforme necessário.

Agora, você está pronto para construir e explorar seu banco de dados para a oficina mecânica!
