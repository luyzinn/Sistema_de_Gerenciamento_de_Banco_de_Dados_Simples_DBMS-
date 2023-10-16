# Projeto de Sistema de Gerenciamento de Biblioteca em SQL

Olá, este é o meu projeto prático de Sistema de Gerenciamento de Banco de Dados (DBMS) usando SQL. Neste projeto, simulei um sistema de gerenciamento de biblioteca para demonstrar minhas habilidades em criação de tabelas, inserção de dados, consultas SQL e otimização de consultas com o uso de índices.

## Propósito do Projeto

Decidi criar este projeto como uma forma de praticar e criar experiência prática em lidar com sistemas de banco de dados e minha capacidade de otimizar consultas para melhorar o desempenho geral do sistema.

## Configuração e Utilização

### Configuração do Ambiente

Para usar este projeto, você precisará ter um sistema de gerenciamento de banco de dados SQL instalado. Eu usei o SQL Server 2022 da Microsoft, rodei ele em uma VM usando o Oracle Virtual Machine com OS Windows Server 2022.



### Criação das Tabelas

No arquivo `create_tables.sql`, você encontrará os comandos SQL para criar as tabelas necessárias. As tabelas criadas são `Livros` e `Clientes`.

``` sql 
-- Criação da tabela Livros
CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao INT
);

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

```


### Inserção de Dados

Use os comandos SQL no arquivo `insert_data.sql` para adicionar exemplos de livros e clientes ao banco de dados.

``` sql
INSERT INTO Livros (titulo, autor, ano_publicacao) VALUES 
('Dom Casmurro', 'Machado de Assis', 1899),
('A Revolução dos Bichos', 'George Orwell', 1945),
('Cem Anos de Solidão', 'Gabriel Garcia Marquez', 1967);

INSERT INTO Clientes (nome, email) VALUES 
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com');

```

### Consultas de Dados

Demonstrei várias consultas de dados no arquivo `queries.sql`, incluindo consultas para recuperar todos os livros, todos os clientes e consultas específicas baseadas em critérios como autor.

``` sql
-- Consulta para obter todos os livros
SELECT * FROM Livros;

-- Consulta para obter todos os clientes
SELECT * FROM Clientes;

-- Consulta para obter todos os livros de um autor específico
SELECT * FROM Livros WHERE autor = 'Machado de Assis';
```

### Otimização de Consultas

No arquivo `create_index.sql`, você encontrará exemplos de como adicionei índices para otimizar as consultas, melhorando assim o desempenho do sistema como um todo.

```sql
CREATE INDEX idx_autor ON Livros(autor);
```
#### Por que adicionei esse índice?
Ao adicionar esse índice, as consultas que filtram por autor na tabela Livros devem ter um desempenho melhorado. Vale a pena se certificar de executar este comando após a criação das tabelas e a inserção dos dados. Isso pode ajudar a melhorar a eficiência das consultas, especialmente quando lidamos com grandes conjuntos de dados em um banco já pronto.

### Feedback e contribuição

Se você tiver sugestões, dúvidas ou quiser contribuir para este projeto, fique à vontade para entrar em contato comigo. Estou sempre aberto a novas ideias e formas de melhorar minhas habilidades em gerenciamento de banco de dados.

Fique à vontade para explorar e utilizar este projeto como referência para suas próprias práticas em SQL!
