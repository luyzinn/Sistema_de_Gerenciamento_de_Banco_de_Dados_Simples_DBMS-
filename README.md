# Projeto de Sistema de Gerenciamento de Biblioteca em SQL

Olá, este é o meu projeto prático de Sistema de Gerenciamento de Banco de Dados (DBMS) usando SQL. Neste projeto, simulei um sistema de gerenciamento de biblioteca para demonstrar minhas habilidades em criação de tabelas, inserção de dados, consultas SQL e otimização de consultas com o uso de índices.

## Propósito do Projeto

Decidi criar este projeto como uma forma de praticar e criar experiência prática em lidar com sistemas de banco de dados e minha capacidade de otimizar consultas para melhorar o desempenho geral do sistema.

## Configuração e Utilização

### Configuração do Ambiente

Para usar este projeto, você precisará ter um sistema de gerenciamento de banco de dados SQL instalado. Eu usei o SQL Server 2022 da Microsoft, rodei ele em uma VM usando o Oracle Virtual Machine com OS Windows Server 2022.

Um detalhe interessante é que seguindo as boas práticas, configurei na VM que cada serviço do SQL Server fosse um usuário, isso em um ambiente on premisse ajuda ainda mais a dificultar a ação de hackers:

![instalação](https://github.com/luyzinn/Cria-o-de-um-Sistema-de-Gerenciamento-de-Banco-de-Dados-Simples-DBMS-/blob/38e31615882add5625680f1b1c8af7de46a31ba0/WhatsApp%20Image%202023-10-13%20at%2021.02.24.jpeg)

#### Aqui temos os serviços que geralmente uso, cadastrados como usuários numa máquina DC (Domain Controler) que será responsável por liberar o acesso a máquina que esta com o SQL Server Instalado:

![instalação](https://github.com/luyzinn/Cria-o-de-um-Sistema-de-Gerenciamento-de-Banco-de-Dados-Simples-DBMS-/blob/5e0667b8090aeda3f380ad5ecfb6f7138678d7af/WhatsApp%20Image%202023-10-13%20at%2023.19.38.jpeg)





### Criação das Tabelas

No arquivo `create_tables.sql`, você encontrará os comandos SQL para criar as tabelas necessárias. As tabelas criadas são `Livros`, `Clientes` e `Pedidos`.

``` sql 
-- Criação da tabela Livros
CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao INT
);

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    estado VARCHAR(50)
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    livro_id INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (livro_id) REFERENCES Livros(id)
);

```
Neste exemplo, a tabela "Pedidos" possui um ID de pedido, IDs de cliente e de livro que são vinculados às tabelas "Clientes" e "Livros" respectivamente, e um campo de data de pedido para registrar a data em que o pedido foi feito.
Ao criar essa tabela, nós conseguimos associar os pedidos dos clientes aos livros específicos que eles escolheram.

### Inserção de Dados

Use os comandos SQL no arquivo `insert_data.sql` para adicionar exemplos de livros e clientes ao banco de dados.

``` sql
INSERT INTO Livros (titulo, autor, ano_publicacao) VALUES 
('Dom Casmurro', 'Machado de Assis', 1899),
('A Revolução dos Bichos', 'George Orwell', 1945),
('Cem Anos de Solidão', 'Gabriel Garcia Marquez', 1967);

-- Inserção de dados na tabela Clientes com informações adicionais
INSERT INTO Clientes (nome, email, endereco, telefone, cidade, estado) VALUES 
('João Silva', 'joao@email.com', 'Rua A, 123', '1234567890', 'São Paulo', 'SP'),
('Maria Souza', 'maria@email.com', 'Avenida B, 456', '9876543210', 'Rio de Janeiro', 'RJ');

-- Inserção de dados na tabela Pedidos
INSERT INTO Pedidos (cliente_id, livro_id, data_pedido) VALUES
(1, 1, '2023-10-15'),
(2, 2, '2023-10-15');
```

### Consultas de Dados

Aqui estão várias consultas de dadoos, essas estão no arquivo `queries.sql`, incluindo consultas para recuperar todos os livros, todos os clientes e consultas específicas baseadas em critérios como autor. Vou adicionando novas consultas a medida que os treinamentos forem surgindo.

``` sql
-- Consulta para obter todos os livros
SELECT * FROM Livros;

-- Consulta para obter todos os clientes
SELECT * FROM Clientes;

-- Consulta para obter todos os livros de um autor específico
SELECT * FROM Livros WHERE autor = 'Machado de Assis';

-- Você pode usar a seguinte consulta SQL para obter todos os livros escolhidos por clientes que residem em São Paulo:
SELECT Livros.titulo, Clientes.nome, Clientes.cidade
FROM Livros
JOIN Pedidos ON Livros.id = Pedidos.livro_id
JOIN Clientes ON Pedidos.cliente_id = Clientes.id
WHERE Clientes.cidade = 'São Paulo';

-- Para visualizar todos os livros que foram escolhidos por clientes em um dia específico:
SELECT Livros.titulo, Clientes.nome, Pedidos.data_pedido
FROM Livros
JOIN Pedidos ON Livros.id = Pedidos.livro_id
JOIN Clientes ON Pedidos.cliente_id = Clientes.id
WHERE Pedidos.data_pedido = '2023-10-15';
```

### Otimização de Consultas

No arquivo `create_index.sql`, você encontrará exemplos de como adicionei índices para otimizar as consultas, melhorando assim o desempenho do sistema como um todo.

```sql
CREATE INDEX idx_autor ON Livros(autor);
```

```sql
CREATE INDEX idx_autor_ano ON Livros(autor, ano_publicacao);
```

```sql
CREATE INDEX idx_cidade ON Clientes(cidade);
```

#### Por que adicionei esses índices?
Ao adicionar esse índice, as consultas que envolvem as colunas nome, autor, ano_publicacao e cidade devem ter um desempenho melhorado. Vale a pena se certificar de executar este comando após a criação das tabelas e a inserção dos dados. Isso pode ajudar a melhorar a eficiência das consultas, especialmente quando lidamos com grandes conjuntos de dados em um banco já pronto.

### Feedback e contribuição

Se você tiver sugestões, dúvidas ou quiser contribuir para este projeto, fique à vontade para entrar em contato comigo. Estou sempre aberto a novas ideias e formas de melhorar minhas habilidades em gerenciamento de banco de dados.

Fique à vontade para explorar e utilizar este projeto como referência para suas próprias práticas em SQL!
