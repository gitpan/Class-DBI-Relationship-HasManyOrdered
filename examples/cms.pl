#!/usr/bin/perl -w

use strict;

use ContentManager::Page;
use ContentManager::Image;
use Data::Dumper;

my $page = ContentManager::Page->create( {title=>'Extending Class::DBI', date_to_publish=>'dd/mm/yyyy'});

my ($image1) = ContentManager::Image->search(name=>'Class::DBI logo');
my @figures = ContentManager::Image->search(name=>'Class Diagram (CDBI)', {order_by => 'filename'});
my ($author_image) = ContentManager::Image->search(name=>'Aaron Trevena - portrait');

# warn Dumper(@figures);

$page->insert_Images([@figures]); # inserts figures into next/last available positions, sets positions

$page->prepend_to_Images($image1->id); # inserts image into first position, resets other image positions

$page->append_to_Images($author_image); # appends image to last position

$page->delete_Images($author_image); # delete author image
