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
