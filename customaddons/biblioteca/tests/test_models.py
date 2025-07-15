from odoo.tests import common, tagged, TransactionCase

@tagged('biblioteca')
class TestAutor(TransactionCase):


    def setUp(self):
        super().setUp()
        self.livro_class = self.env['biblioteca.livro']
        self.autor_class = self.env['biblioteca.autor']

        self.jose = self.autor_class.create({
            'name': 'José de Alencar'
        })
        self.machado = self.autor_class.create({
            'name': 'Machado de Assis'
        })
        self.livro1 = self.livro_class.create({
            'titulo': 'O Guarani'})
        self.livro1.autor_ids = [self.jose.id]
        self.livro2 = self.livro_class.create({
            'titulo': 'Memórias Póstumas de Brás Cubas',
            'autor_ids': [self.machado.id]
        })
        self.livro3 = self.livro_class.create({
            'titulo': 'Dom Casmurro',
            'autor_ids': [self.machado.id]
        })

        self.resnick = self.autor_class.create({
            'name': 'Resnick'
        })
        self.halliday = self.autor_class.create({
            'name': 'Halliday'
        })

        self.livro4 = self.livro_class.create({
            'titulo': 'Física I',
            'autor_ids': [self.resnick.id, self.halliday.id]
        })

    def test_autor_create(self):
        self.assertEqual(self.jose.name, 'José de Alencar')
        self.assertEqual(self.machado.name, 'Machado de Assis')

    def test_livro_create(self):
        self.assertEqual(self.livro1.titulo, 'O Guarani')
        self.assertEqual(self.livro2.titulo, 'Memórias Póstumas de Brás Cubas')

    def test_autor_qtde_livros(self):
        self.assertEqual(self.jose.qtde_livros, 1)
        self.assertEqual(self.machado.qtde_livros, 2)
        self.assertEqual(self.resnick.qtde_livros, 1)
        self.assertEqual(self.halliday.qtde_livros, 1)

    def test_autor_livro_ids(self):
        self.assertEqual(self.jose.livro_ids, self.livro1)

        livros = self.livro_class.browse([self.livro2.id, self.livro3.id])
        self.assertEqual(self.machado.livro_ids, livros)

    def test_livro_autor_ids(self):
        self.assertEqual(self.livro1.autor_ids, self.jose)
        self.assertEqual(self.livro2.autor_ids, self.machado)
        self.assertEqual(self.livro3.autor_ids, self.machado)

        autores = self.autor_class.browse([self.halliday.id, self.resnick.id])
        self.assertEqual(self.livro4.autor_ids, autores)
        