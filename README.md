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
